Class {
	#name : #TypInfMethod,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethod >> incomingReturns [

	^ incoming
		  at: #return
		  ifPresent: [ :s | s collect: #origin ]
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
		  arguments: (self incomingArguments collect: [ :e | state at: e ])
]

{ #category : #accessing }
TypInfMethod >> transfer [

	| type |
	type := state at: self.
	state at: self put: (CompiledMethod
			 typAsFunctionTypeWithResult:
			 (self incomingReturns collect: #type) typAsType
			 arguments: (self incomingArguments collect: #type)
			 argumentsOptional: false
			 signalsAlways: nil).
	TypInfSignal
		emitMessage: 'transfer'
		from: type
		to: (state at: self)
		node: self
]
