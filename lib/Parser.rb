require 'parslet'

module FlyingStateMachine
    class Parser < Parslet::Parser

        # whitespace
        rule(:spaces) { match("\s").repeat(1) }
        rule(:spaces?) { spaces.maybe }

        rule(:newline) { match("\n").repeat(1) }
        rule(:newline?) { newline.maybe }
        
        # data
        rule(:bit) { str('0') | str('1') }

        # input for the machine
        rule(:input) {
            str("input") >> spaces? >> bit.repeat
        }

        # state machine nodes
        rule(:node) {
            (state | machine) >> newline
        }

        # states
        rule(:state) {
            str("state") 
        }


        # state machine declaration
        rule(:machine) {
            str("machine") >>
            spaces >>
            any >>
            spaces? >>
            str("{") >>
            newline? >>
            node.repeat >> 
            str("}")
        }
    
        # what the parser looks for first
        root(:input)
    end
    
end