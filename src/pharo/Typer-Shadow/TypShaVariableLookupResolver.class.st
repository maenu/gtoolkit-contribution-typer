Class {
	#name : #TypShaVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypVariableLookup>'>
	aLookup push: self.
	aLookup receiver isNamed
		ifFalse: [ TypNoTypeError signal ].
	aLookup receiver hasClassDescription
		ifFalse: [ TypNoTypeError signal ].
	^ aLookup receiver classDescription typShaShadows
		flatCollect: [ :f | f resolveVariable: aLookup copy ]
]
