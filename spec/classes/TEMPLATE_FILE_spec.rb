require 'spec_helper'
 
describe 'template_file', :type => 'class' do


template_file = {
    'template_location' => '/tmp/file.sh.erb' {
            'ensure' => 'present',
	'file_owner' => 'root',
	'file_group' => 'root',
	'file_mode'  => '744',
	}
}

    
  
end

