Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ aLookup receiver classDescription methods
		anySatisfy: [ :e | e typShaResolvesMethod: aLookup selector ]
]

{ #category : #printing }
TypShaMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'sha method'
]

{ #category : #accessing }
TypShaMethodResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	aLookup initializeResolver: self.
	^ self
		resolve: aLookup
		reduce: (aLookup receiver classDescription methods
				select: [ :m | m typShaResolvesMethod: aLookup selector ]
				thenCollect: [ :m | 
					self flag: 'TODO new is dirty, use anonymous subclasses?'.
					aLookup receiver classDescription new perform: m selector with: aLookup ])
]
