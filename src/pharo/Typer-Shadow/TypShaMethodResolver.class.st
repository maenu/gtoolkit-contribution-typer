Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ (TypShaIndex instance
		methodResolvers: aLookup receiver classDescription
		selector: aLookup selector) isNotEmpty
]

{ #category : #printing }
TypShaMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'sha method'
]

{ #category : #accessing }
TypShaMethodResolver >> result: aLookup [
	^ self
		resolve: aLookup
		reduce: ((TypShaIndex instance
				methodResolvers: aLookup receiver classDescription
				selector: aLookup selector)
				collect: [ :m | nil withArgs: {aLookup} executeMethod: m ])
]
