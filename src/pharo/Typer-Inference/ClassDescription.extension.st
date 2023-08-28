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
ClassDescription >> typInfRun: aSymbol [
	^ self typInfRun: aSymbol duration: 5 minutes
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfRun: aSymbol duration: aDuration [
	^ self >> aSymbol typInfRun: aDuration
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfRunAndMonitor: aSymbol [
	^ self typInfRunAndMonitor: aSymbol duration: 1 minutes
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfRunAndMonitor: aSymbol duration: aDuration [
	^ self >> aSymbol typInfRunAndMonitor: aDuration
]
