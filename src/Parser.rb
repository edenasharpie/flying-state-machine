require 'parslet'

module FlyingStateMachine
    class Parser < Parslet::Parser

        # whitespace
        rule(:spaces) { match("\s").repeat(1) }
        rule(:spaces?) { spaces.maybe }
        
        # data
        rule(:bit) { str('0') | str('1') }

        # state machine declaration
        rule(:machine) {
            str("machine") >>
            spaces >>
            any >>
            spaces? >>
            str("{") >>

            str("}")
        }
    
        # what the parser looks for first
        root(:machine)
    end
    
end

parser = FlyingStateMachine::Parser.new
p parser.parse('machine A {}')