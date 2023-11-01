Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ TypShaIndex instance canResolveVariable: aLookup
]

{ #category : #printing }
TypShaVariableResolver >> printOn: aStream [

	aStream nextPutAll: 'sha variable'
]

{ #category : #accessing }
TypShaVariableResolver >> result: aLookup root: anotherLookup [
	^ TypShaIndex instance resultVariable: aLookup root: anotherLookup
]
