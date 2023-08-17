Class {
	#name : #TypInfAbstractInterpretationMessageStrategy,
	#superclass : #TypInfInlineMethodMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfAbstractInterpretationMessageStrategy >> canInstall [
	| receiver |
	receiver := message receiver.
	receiver isNamed ifFalse: [ ^ false ].
	receiver hasClassDescription ifFalse: [ ^ false ].
	^ receiver classDescription class methods
		detect: [ :m | 
			m pragmas
				anySatisfy: [ :p | 
					p selector = #typInfCanAbstractInterpret:
						and: [ p arguments first = message selector ] ] ]
		ifFound: [ :m | receiver classDescription perform: m selector with: message ]
		ifNone: [ false ]
]

{ #category : #accessing }
TypInfAbstractInterpretationMessageStrategy >> newContexts [
	| receiver method |
	receiver := message receiver.
	method := receiver classDescription class methods
			detect: [ :m | 
				m pragmas
					anySatisfy: [ :p | 
						p selector = #typInfAbstractInterpret:
							and: [ p arguments first = message selector ] ] ]
			ifNone: [ ^ #() ].
	^ {receiver classDescription perform: method selector with: message}
]
