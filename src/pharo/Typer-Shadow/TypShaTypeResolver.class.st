Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeResolver >> canResolve: aLookup [
	^ TypShaIndex instance canResolveType: aLookup
]

{ #category : #printing }
TypShaTypeResolver >> printOn: aStream [

	aStream nextPutAll: 'sha type'
]

{ #category : #accessing }
TypShaTypeResolver >> result: aLookup root: anotherLookup [
	^ TypShaIndex instance resultType: aLookup root: anotherLookup
]
