Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeResolver >> canResolve: aLookup [
	^ (TypShaMethodIndex instance typeResolvers: aLookup classDescription)
		isNotEmpty
]

{ #category : #printing }
TypShaTypeResolver >> printOn: aStream [

	aStream nextPutAll: 'sha type'
]

{ #category : #accessing }
TypShaTypeResolver >> resolve: aLookup [
	| class |
	self assert: [ self canResolve: aLookup ].
	aLookup initializeResolver: self.
	class := TypShaMethodIndex instance anonymousClass: aLookup classDescription.
	^ self
		resolve: aLookup
		reduce: ((TypShaMethodIndex instance typeResolvers: aLookup classDescription)
				collect: [ :s | class typShaResolve: s lookup: aLookup ])
]
