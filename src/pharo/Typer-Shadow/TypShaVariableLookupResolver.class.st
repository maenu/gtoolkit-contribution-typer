Class {
	#name : #TypShaVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableLookupResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and: [ aLookup receiver classDescription typShaShadows isNotEmpty ] ]
]

{ #category : #accessing }
TypShaVariableLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ self
		reduce:
			(aLookup receiver classDescription typShaShadows
				flatCollect: [ :e | e resolveVariable: aLookup ])
]
