Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeResolver >> canResolve: aLookup [
	^ (TypShaIndex instance typeResolvers: aLookup classDescription)
		isNotEmpty
]

{ #category : #printing }
TypShaTypeResolver >> printOn: aStream [

	aStream nextPutAll: 'sha type'
]

{ #category : #accessing }
TypShaTypeResolver >> result: aLookup [
	| class |
	class := TypShaIndex instance anonymousClass: aLookup classDescription.
	^ self
		resolve: aLookup
		reduce: ((TypShaIndex instance typeResolvers: aLookup classDescription)
				collect: [ :s | class typShaResolve: s lookup: aLookup ])
]
