Class {
	#name : #TypShaVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypVariableLookup>'>
	^ (aLookup receiverType asCollection
		select: [ :e | e isNamed and: [ e hasClassDescription ] ])
		flatCollect: [ :e | 
			e classDescription typShaShadows
				collect: [ :f | 
					f class instVarNames
						detect: [ :g | g = ('___' , aLookup selector asString) ]
						ifFound: [ :g | f instVarNamed: g ]
						ifNone: [ TypNoTypeError signal ] ] ]
]
