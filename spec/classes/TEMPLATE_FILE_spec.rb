require 'spec_helper'
 
describe 'template_file', :type => 'class' do

file_name = '/tmp/file'
template_location = '/tmp/file.sh.erb'
file_owner = 'root'
file_group = 'root'
file_mode  = '0744'

 context "Should create a file from a specific template" do
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
    end
  end
end
