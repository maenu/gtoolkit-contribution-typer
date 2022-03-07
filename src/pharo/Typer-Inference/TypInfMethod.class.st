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

{ #category : #execution }
TypInfMethod >> ougoingExecute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfMethod >> ougoingExecute: aNode [

	^ self outgoingAt: #execute put: aNode
]

{ #category : #accessing }
TypInfMethod >> transfer [

	| type |
	type := CompiledMethod
		        typAsFunctionTypeWithResult:
		        (self incomingReturns collect: [ :f | state at: f ])
			        typAsType
		        arguments:
		        (self incomingArguments collect: [ :a | state at: a ])
		        argumentsOptional: false
		        signalsAlways: nil.
	state at: self put: type
]
