require 'spec_helper'
 
describe 'template_file', :type => 'class' do

file_name = '/tmp/file.sh'
template_location = "template_file/test.erb"
file_owner = 'root'
file_group = 'root'
file_mode  = '0744'
test_fact_value = 'TEST123456'

  context "Should create a file from a specific template" do
    let(:facts) {
      { :test_fact => test_fact_value }
    }
    let(:params) {
      { :files => 
        { file_name => 
          {'template_location' => template_location, 
      	   'file_owner' => file_owner, 
      	   'file_group' => file_group,
           'file_mode' => file_mode,
          }
        }
      }
    }
    it do
      should contain_file(file_name).with(
        'owner' => file_owner, 
      	'group' => file_group,
        'mode' => file_mode,
      )
      file_content = catalogue().resource('file', "#{file_name}").send(:parameters)[:content]
      expect(file_content).to eq("Value = #{test_fact_value}")
    end
  end
end
