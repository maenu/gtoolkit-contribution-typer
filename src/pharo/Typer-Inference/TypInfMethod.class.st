Class {
	#name : #TypInfMethod,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethod >> inReturns [
	^ in
		at: #return
		ifPresent: [ :s | s collect: #origin ]
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfMethod >> initialize: aState [
	super initialize: aState.
	state
		at: self
		put: (CompiledMethod
				typAsFunctionTypeWithResult: TypUnknownType instance
				arguments: (node arguments collect: [ :e | TypUnknownType instance ])
				argumentsOptional: false
				signalsAlways: nil)
]

{ #category : #accessing }
TypInfMethod >> method [

	^ context self
		  lookupMethod: node selector asSymbol
		  arguments: (self inArguments collect: #type)
]

{ #category : #accessing }
TypInfMethod >> methodNode [

	^ self
]

{ #category : #accessing }
TypInfMethod >> transfer [

	state at: self put: ((CompiledMethod
			  typAsFunctionTypeWithResult:
				  (self inReturns collect: #type) typAsType
			  arguments: (self inArguments collect: #type)
			  argumentsOptional: false
			  signalsAlways: nil)
			 outAt: #method ifAbsentPut: [ self ];
			 yourself)
]
