Class {
	#name : #TypInfAbsMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-AbstractInterpretation'
}

{ #category : #accessing }
TypInfAbsMethodResolver >> canCache: aLookup [
	^ false
]

{ #category : #accessing }
TypInfAbsMethodResolver >> canResolve: aLookup [
	^ TypInfAbsIndex instance canResolveMethod: aLookup
]

{ #category : #accessing }
TypInfAbsMethodResolver >> resolve: aLookup reduce: aCollection [
	aCollection ifEmpty: [ ^ TypUnknownType instance ].
	self flag: 'TODO make more of alternatives instead of just taking first'.
	^ aCollection asOrderedCollection sort first
]

{ #category : #accessing }
TypInfAbsMethodResolver >> result: aLookup [
	^ TypInfAbsIndex instance resolveMethod: aLookup
]
