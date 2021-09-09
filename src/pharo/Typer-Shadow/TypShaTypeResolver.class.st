Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeResolver >> canResolve: aLookup [
	^ aLookup classDescription typShaShadows
		anySatisfy: [ :e | e canResolveType: aLookup ]
]

{ #category : #accessing }
TypShaTypeResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	self addDependent: aLookup label: #resolve:.
	^ self
		  resolve: aLookup
		  reduce: (aLookup classDescription typShaShadows collect: [ :e | 
				   self
					   addDependent: (e resolveType: aLookup)
					   label: #shadow
					   data: (e class lookupSelector: #resolveType:) ])
]
