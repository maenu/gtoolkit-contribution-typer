Class {
	#name : #TypShaVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableLookupResolver >> resolveBasic: aLookup [
	aLookup receiver isNamed
		ifFalse: [ ^ #() ].
	aLookup receiver hasClassDescription
		ifFalse: [ ^ #() ].
	^ aLookup receiver classDescription typShaShadows
		flatCollect:
			[ :e | (e resolveVariable: aLookup) do: [ :f | f addOrigin: aLookup asOrigin ] ]
]
