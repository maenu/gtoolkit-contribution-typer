Extension { #name : #ClassDescription }

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfAbstractInterpret: aMessage [
	| method |
	method := self class methods
			detect: [ :m | 
				m pragmas
					anySatisfy: [ :p | 
						p selector = #typInfAbstractInterpret:
							and: [ p arguments first = aMessage selector ] ] ].
	^ {self perform: method selector with: aMessage}
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfCanAbstractInterpret: aMessage [
	^ self class methods
		detect: [ :m | 
			m pragmas
				anySatisfy: [ :p | 
					p selector = #typInfCanAbstractInterpret:
						and: [ p arguments first = aMessage selector ] ] ]
		ifFound: [ :m | self perform: m selector with: aMessage ]
		ifNone: [ false ]
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfRunAndMonitor: aSymbol [
	^ (self >> aSymbol) typInfRunAndMonitor
]
