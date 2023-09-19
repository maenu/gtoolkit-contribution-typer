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
	^ self
		resolve: aLookup
		reduce: ((TypShaIndex instance typeResolvers: aLookup classDescription)
				collect: [ :m | aLookup classDescription rFwithArgs: {aLookup} executeMethod: m ])
]
