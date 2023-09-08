Extension { #name : #ClassDescription }

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfAbstractInterpret: aMessage [
	^ self class methods
		detect: [ :m | 
			m pragmas
				anySatisfy: [ :p | 
					p selector = #typInfAbstractInterpret:
						and: [ p arguments first = aMessage selector ] ] ]
		ifFound: [ :e | self perform: e selector with: aMessage ]
		ifNone: [ self error: 'cannot abstract interpret' ]
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
