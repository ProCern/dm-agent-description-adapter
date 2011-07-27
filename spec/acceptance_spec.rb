require 'rubygems'
require 'pathname'

require Pathname(__FILE__).dirname + 'spec_helper'

require Pathname(__FILE__).dirname + 'fixtures/template'
require Pathname(__FILE__).dirname + 'fixtures/question'

index = Pathname(__FILE__).dirname + 'fixtures/templates/dsc_index.xml'

DataMapper.setup(:default,
                 :adapter => 'agent_description',
                 :agent_template_index => index.realpath)


describe "Agent Description Adapter" do
  describe "All Templates" do

    before do
      @templates = Template.all
    end

    it 'should find all the templates' do
      @templates.size.should == 9
    end

    it 'should auto-load the questions' do
      @templates.to_a.first.questions.should_not be_empty
    end

  end

  describe "Single Template" do
    before do
      @template = Template.get('os/linux/linux-core')
    end

    it 'should be findable by the path' do
      @template.should_not be_nil
    end

    it 'should get the name' do
      @template.name.should == "Linux Core"
    end

    it 'should get the description' do
      @template.description.should == "CPU and other general Linux metrics"
    end

    it 'should get the path' do
      @template.path.should == 'os/linux/linux-core'
    end

    it 'should set the max_associations_per_configuration if its a base-only template' do
      @template.max_associations_per_configuration.should == 1
    end

    it 'should leave max_associations_per_configuration as nil for non-base-only templates' do
      t = Template.get('os/linux/linux-varlog')
      t.max_associations_per_configuration.should be_nil
    end

    it 'should have some questions' do
      @template.questions.to_a.first.name.should == "cpu-minutes"

    end
  end

  describe "Question" do
    before do
      @template = Template.get('os/linux/linux-core')
      @question = @template.questions.to_a.first
      @regex_q = @question
      @choices_q = @template.questions[3]
      @hidden_q = @template.questions[4]
    end

    it 'should have a name' do
      @question.name.should == 'cpu-minutes'
    end

    it 'should have some text' do
      @question.text.should == "Minimum time CPU usage must exceed threshold before alertable (in minutes)"
    end

    it 'should get the validation regex if there is one' do 
      @regex_q.validation_regex.should == /^\d+$/
    end

    it 'should have the regex be nil if there is not one' do
      @choices_q.validation_regex.should be_nil
    end

    it 'should get the question choices' do
      @choices_q.choices.size.should == 2
      @choices_q.choices.first.title.should == "No"
      @choices_q.choices.first.value.should == "0"

      @choices_q.choices.last.title.should == "Yes"
      @choices_q.choices.last.value.should == "1"
    end

    it 'should have choices be nil if there are none' do
      @regex_q.choices.should be_nil
    end

    it 'should support a hidden question' do
      @hidden_q.hidden.should be_true
    end

  end

  describe "Restricted Clients" do
    before do 
      @template = Template.get('restricted-clients')
    end

    it 'should have some' do
      @template.restricted_clients.should == ['API', 'SSBE']
    end

  end

  describe "Restricted Platforms" do
    before do 
      @template = Template.get('restricted-platforms')
    end

    it 'should have some' do
      @template.restricted_platforms.should == ['Linux', 'Solaris']
    end

  end

end

