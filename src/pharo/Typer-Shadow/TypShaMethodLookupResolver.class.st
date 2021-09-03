Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypShaLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and: [ aLookup receiver classDescription typShaShadows
						anySatisfy: [ :e | e canResolveMethod: aLookup ] ] ]
]

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ self
		reduce:
			(aLookup receiver classDescription typShaShadows
				flatCollect: [ :e | e resolveMethod: aLookup ])
]
