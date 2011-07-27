require 'rubygems'
gem 'dm-core'

require 'nokogiri'
require 'pathname'

require 'pp'

module DataMapper
  module Adapters

    class AgentDescriptionAdapter < AbstractAdapter

      attr_accessor :agent_index

      def initialize(name, uri_or_options)
        super

        @agent_index = uri_or_options[:agent_template_index].to_s
        @parsing_xml_time = 0
      end

      def index_xml
        File.open(@agent_index) do |f|
          Nokogiri::XML.parse(f)
        end
      end

      def read_many(query)
        @parsing_xml_time = 0
        start = Time.now

        raise ArgumentError, "Can only be used with Templates" unless query.model == Template
        collection = Collection.new(query)

        index_xml.xpath('/templates/template').each do |template_xml|
          template_start = Time.now
          template = template_from_xml(template_xml, query)
          collection.send(:add, template)
        end

        total = Time.now - start
        DataMapper.logger.info " Fetching All Agent Config Descriptions - Total: #{sprintf("%0.4f", total)}, XML Parsing: #{time_with_percent(@parsing_xml_time, total)}"

        collection
      end

      def read_one(query)
        start = Time.now
        @parsing_xml_time = 0
        path = query.conditions.last.last

        template_xml = index_xml.xpath(%{//template/path[text()="#{path}"]/..}).first
        return unless template_xml

        template = template_from_xml(template_xml, query)

        total = Time.now - start

        DataMapper.logger.info " Fetching Agent Config Description #{path} - Total: #{sprintf("%0.4f", total)}, XML Parsing: #{time_with_percent(@parsing_xml_time, total)}"
        template
      end

      private

      def template_from_xml(xml, query)
        template = Template.new(:name =>        text_for_elem(xml, 'name'),
                                :description => text_for_elem(xml, 'description'),
                                :path =>        text_for_elem(xml, 'path'),
                                :max_associations_per_configuration => text_for_elem(xml, 'max-associations-per-configuration'),
                                :restricted_clients => arr_from_elem(xml, 'restricted-clients', 'client'),
                                :restricted_platforms => arr_from_elem(xml, 'restricted-platforms', 'platform')
                                )

        questions = questions_collection(xml, query)
        template.send(:questions_association).instance_variable_set(:@children, questions)

        template
      end

      def questions_collection(xml, query)
        collection = Collection.new(Query.new(query.repository, Question))
        xml.xpath('questions/question').each do |q_item|
          question = question_from_xml(q_item)
          collection.send(:add, question)
        end
        collection
      end

      def question_from_xml(xml)
        Question.new(:name =>             text_for_elem(xml, 'name'),
                     :text =>             text_for_elem(xml, 'text'),
                     :validation_regex => text_for_elem(xml, 'validation-regex'),
                     :default =>          text_for_elem(xml, 'default'),
                     :hidden =>           text_for_elem(xml, 'hidden') == 'true',
                     :choices =>          xml.xpath('choices').first)
      end

      def text_for_elem(element, search)
        start = Time.now
        result =  if element && el = element.xpath(search).first
                    el.content
                  else
                    nil
                  end
        @parsing_xml_time += Time.now - start
        result
      end

      def arr_from_elem(element, arr_name, el_name)
        start = Time.now
        result =  if element && arr = element.xpath(arr_name).first
                    arr.xpath(el_name).map { |e| e.content }
                  else
                    nil
                  end
        @parsing_xml_time += Time.now - start
        result
      end

      def time_with_percent(time, total)
        sprintf("%0.4f (%0.2f%%)",time, (time/total*100))
      end

    end

  end
end

