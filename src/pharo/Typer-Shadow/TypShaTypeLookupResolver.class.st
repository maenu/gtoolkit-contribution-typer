Class {
	#name : #TypShaTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeLookupResolver >> canResolve: aLookup [
	^ aLookup classDescription typShaShadows
		anySatisfy: [ :e | e canResolveType: aLookup ]
]

{ #category : #accessing }
TypShaTypeLookupResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	^ self reduce:
		  (aLookup classDescription typShaShadows collect: [ :f | 
			   (f resolveType: aLookup) copyWithOrigins: { 
					   (TypLookupOrigin lookup: aLookup).
					   (TypShaMethodOrigin method:
						    (f class lookupSelector: #resolveType:)) } ])
]
