Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeResolver >> canResolve: aLookup [
	^ (TypShaIndex instance resolveType: aLookup) isNotEmpty
]

{ #category : #printing }
TypShaTypeResolver >> printOn: aStream [

	aStream nextPutAll: 'sha type'
]

{ #category : #accessing }
TypShaTypeResolver >> result: aLookup [
	self flag: 'TODO make more of alternatives instead of just taking first'.
	^ (TypShaIndex instance resolveType: aLookup) asOrderedCollection sort first
]
