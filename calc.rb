# calc.rb
class ArgError < StandardError
end

class Calc
  # parse args expression
  def expr(args, count=-1)
   if args =~ /^\\(.)$/
     delims = "[,\n#{$1}]"
     parsed = args.split(/#{delims}/)
     parsed.shift(2)
   else
     delims = "[,\n]"
     parsed = args.split(/#{delims}/)
   end
   parsed.each { |i|
     raise ArgError, "Invalid delimiter list" if i == ""
   }
   
   sum(parsed, count)
  end

  def sum(terms=[], count=-1)
    count -= 1 if count > 0
    terms.map { |term| 
      case term
      when ""
        0
      else
        term.to_i
      end
    }[0..count].inject { |sum, n| sum + n }
  end
end
