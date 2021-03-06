#
# Author:: Adam Jacob (<adam@chef.io>)
# Copyright:: Copyright (c) Chef Software Inc.
# License:: Apache License, Version 2.0
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
#

class Chef
  module Mixin
    module SubclassDirective
      def subclass_directive(sym)
        define_singleton_method sym do
          instance_variable_set(:"@#{sym}", true)
        end

        define_singleton_method :"#{sym}?" do
          !!instance_variable_get(:"@#{sym}")
        end

        define_method :"#{sym}?" do
          self.class.send(:"#{sym}?")
        end
      end
    end
  end
end
