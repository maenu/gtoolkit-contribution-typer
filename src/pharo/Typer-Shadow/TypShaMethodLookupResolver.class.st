Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypMethodLookupResult>'>
	aLookup push: self.
	aLookup receiver isNamed
		ifFalse: [ TypNoTypeError signal ].
	aLookup receiver hasClassDescription
		ifFalse: [ TypNoTypeError signal ].
	^ aLookup receiver classDescription typShaShadows
		flatCollect: [ :f | f resolveMethod: aLookup copy ]
]
