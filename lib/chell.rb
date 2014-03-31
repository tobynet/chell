require "chell/version"

require 'csv'
require 'pry'

module Chell
  class CSV
    attr_reader :table

    def initialize(data, options = {})
      @options = {headers: true}.merge(options)
      @table = ::CSV.new(data, @options).read
      @table.extend ReinforcedCSVTable
    end

    def run_shell!
      @table.pry
    end
  end

  module ReinforcedCSVTable
    def col(index = 0, &block)
      map_wrapper(block){ map{|x| x[index] } }
    end

    def col!(index = 0, &block)
      map.with_index{|x,i| x[index] = (yield x[index], i) } if block_given?
    end

    def row(index = 0, &block)
      map_wrapper(block){ self[index] }
    end

    def write(filename)
      File.write(filename, self.to_csv(write_headers: true))
    end

    # Alias methods
    def csv; self; end
    def s; size; end
    def l; length; end
    def h; headers; end
    # def column(*args); col(*args); end
    # def c(*args); col(*args); end
    # def r(*args); row(*args); end

    private

    def map_wrapper(proc)
      if proc
        (yield).map(&proc)
      else
        yield
      end
    end

  end

end

# An alias method for using Chell
#
#   csv = Chell(File.read('example.csv'))
#   p csv.headers
#
# If a block is given, `csv.table` is passed the block.
#
#   Chell(File.read('example.csv')) do |csv|
#     p csv.headers
#   end
def Chell(*args, &block)
  table = Chell::CSV.new(*args).table
  if block_given?
    yield table
  else
    table
  end
end

