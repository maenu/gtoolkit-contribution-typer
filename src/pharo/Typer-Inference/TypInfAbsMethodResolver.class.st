Class {
	#name : #TypInfAbsMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-AbstractInterpretation'
}

{ #category : #accessing }
TypInfAbsMethodResolver >> canResolve: aLookup [
	| classDescription |
	aLookup root message ifNil: [ ^ false ].
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	classDescription := aLookup receiver classDescription.
	^ (TypInfAbsIndex instance canResolveMethods: aLookup)
		ifEmpty: [ false ]
		ifNotEmpty: [ :s | s allSatisfy: [ :m | nil withArgs: {aLookup root message} executeMethod: m ] ]
]

{ #category : #accessing }
TypInfAbsMethodResolver >> result: aLookup [
	^ (TypInfAbsIndex instance resolveMethods: aLookup)
		collect: [ :m | aLookup -> (nil withArgs: {aLookup root message} executeMethod: m) ]
]
