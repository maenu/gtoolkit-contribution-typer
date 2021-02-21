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
	aLookup receiverType isNamed
		ifFalse: [ TypNoTypeError signal ].
	aLookup receiverType hasClassDescription
		ifFalse: [ TypNoTypeError signal ].
	^ aLookup receiverType classDescription typShaShadows
		collect: [ :f | 
			f class instVarNames
				detect: [ :g | g = ('___' , aLookup selector asString) ]
				ifFound: [ :g | f instVarNamed: g ]
				ifNone: [ TypNoTypeError signal ] ]
]
