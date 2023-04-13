Class {
	#name : #TypInfMethod,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethod >> incomingReturns [

	^ incoming
		  at: #tighten
		  ifPresent: [ :s | s select: #isReturn thenCollect: #origin ]
		  ifAbsent: [ #(  ) ]
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
TypInfMethod >> method [

	^ state self
		  lookupMethod: node selector asSymbol
		  arguments: (self incomingArguments collect: #type)
]

{ #category : #accessing }
TypInfMethod >> methodNode [

	^ self
]

{ #category : #accessing }
TypInfMethod >> transfer [

	state at: self put: ((CompiledMethod
			  typAsFunctionTypeWithResult:
				  (self incomingReturns collect: #type) typAsType
			  arguments: (self incomingArguments collect: #type)
			  argumentsOptional: false
			  signalsAlways: nil)
			 outgoingAt: #method ifAbsentPut: [ self ];
			 yourself)
]
