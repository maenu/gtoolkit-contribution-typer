Class {
	#name : #TypInfMethod,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #execution }
TypInfMethod >> execute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfMethod >> execute: aNode [

	^ self outgoingAt: #execute put: aNode
]

{ #category : #accessing }
TypInfMethod >> initialize: aState [

	state := aState.
	^ state at: self put: (CompiledMethod
			 typAsFunctionTypeWithResult: TypUnknownType instance
			 arguments:
			 (node arguments collect: [ :e | TypUnknownType instance ])
			 argumentsOptional: false
			 signalsAlways: nil)
]

{ #category : #accessing }
TypInfMethod >> methodIn: aState [

	^ aState self
		  lookupMethod: node selector asSymbol
		  arguments: (self arguments collect: [ :e | aState at: e ])
]

{ #category : #accessing }
TypInfMethod >> transfer [

	| type |
	type := CompiledMethod
		        typAsFunctionTypeWithResult: (incoming
				         select: [ :e | e data = #return ]
				         thenCollect: [ :e | state at: e origin ]) typAsType
		        arguments: (self arguments collect: [ :a | state at: a ])
		        argumentsOptional: false
		        signalsAlways: nil.
	state at: self put: type
]
