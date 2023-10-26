Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ (TypShaIndex instance resolveVariable: aLookup) isNotEmpty
]

{ #category : #printing }
TypShaVariableResolver >> printOn: aStream [

	aStream nextPutAll: 'sha variable'
]

{ #category : #accessing }
TypShaVariableResolver >> result: aLookup [
	self flag: 'TODO make more of alternatives instead of just taking first'.
	^ (TypShaIndex instance resolveVariable: aLookup) asOrderedCollection sort
		first
]
