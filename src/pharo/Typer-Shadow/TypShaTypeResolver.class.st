Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypShaResolver,
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
	^ self resolve: aLookup reduce: (TypShaIndex instance resolveType: aLookup)
]
