#
# Copyright:: 2012, Matthias Marschall <mm@agileweboperations.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'chef/handler'
require 'flowdock'

class FlowdockHandler < Chef::Handler

  def initialize(options = {})
    @flow = Flowdock::Flow.new(:api_token => options[:api_token],
                               :source => options[:source] || "Chef Client",
                               :from => options[:from] || {})
  end

  def report
    unless false #success?
      @flow.push_to_team_inbox(:subject => "Chef Client run on #{node} failed!",
        :content => formatted_exception,
        :tags => ["chef", node.chef_environment, node.name])
    end
  end
end