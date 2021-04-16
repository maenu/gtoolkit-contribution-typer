Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and: [ aLookup receiver classDescription typShaShadows isNotEmpty ] ]
]

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ self
		reduce:
			(aLookup receiver classDescription typShaShadows
				flatCollect: [ :e | e resolveMethod: aLookup ])
]
