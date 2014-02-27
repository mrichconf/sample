# calc.rb
class Calc
  # parse args expression
  def expr(args, count=-1)
   sum(args.split(/,/), count)
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
