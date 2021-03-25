Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	aLookup push: self.
	aLookup receiver isNamed
		ifFalse: [ ^ #() ].
	aLookup receiver hasClassDescription
		ifFalse: [ ^ #() ].
	^ aLookup receiver classDescription typShaShadows
		flatCollect:
			[ :e | (e resolveMethod: aLookup) do: [ :f | f addOrigin: aLookup asOrigin ] ]
]
