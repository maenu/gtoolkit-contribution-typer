Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ (TypShaIndex instance resolveMethod: aLookup) isNotEmpty
]

{ #category : #printing }
TypShaMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'sha method'
]

{ #category : #accessing }
TypShaMethodResolver >> result: aLookup [
	self flag: 'TODO make more of alternatives instead of just taking first'.
	^ (TypShaIndex instance resolveMethod: aLookup) asOrderedCollection sort first
]
