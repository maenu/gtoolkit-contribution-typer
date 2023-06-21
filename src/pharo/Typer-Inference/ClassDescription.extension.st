Extension { #name : #ClassDescription }

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfAbstractInterpret: aMessageNode [
	self class methods
		detect: [ :m | 
			m pragmas
				anySatisfy: [ :p | 
					p selector = #typInfAbstractInterpret:
						and: [ p arguments first = aMessageNode selector ] ] ]
		ifFound: [ :m | self perform: m selector with: aMessageNode ]
		ifNone: [  "noop" ]
]
