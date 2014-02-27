# calc.rb
class ArgError < StandardError
end
class TermError < StandardError
end

class Calc
  # parse args expression
  def expr(args, count=-1)
   negatives=[]
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
     negatives.push(i) if i.to_i < 0
   }
   
   raise TermError, "Negatives not allowed #{negatives.join(',')}"  if negatives.count > 0
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
