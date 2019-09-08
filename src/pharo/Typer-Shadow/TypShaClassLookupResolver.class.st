Class {
	#name : #TypShaClassLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaClassLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassLookup'>
	<typTypeResultAs: '!TypClassLookupResult'>
	^ ((aLookup clazz typShaShadows collect: #asClassLookupResult)
		reject: #isNil)
		ifEmpty: [ nil ]
		ifNotEmpty: [ :f | 
			f first
				lookup: aLookup;
				resolvedBy: aLookup;
				resolver: self;
				yourself ]
]
