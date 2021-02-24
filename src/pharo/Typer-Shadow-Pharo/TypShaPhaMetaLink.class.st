Class {
	#name : #TypShaPhaMetaLink,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaMetaLink class >> shadowedClass [
	^ MetaLink class
]

{ #category : #shadow }
TypShaPhaMetaLink >> mArguments: aLookup [
	<typShaMethod: 'arguments:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{(SequenceableCollection typAsType
				copyWithParameters: {Symbol typAsType})}
]

{ #category : #shadow }
TypShaPhaMetaLink >> mControl: aLookup [
	<typShaMethod: 'control:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaMetaLink >> mMetaObject: aLookup [
	<typShaMethod: 'metaObject:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{Symbol typAsType.
			Object typAsType} typAsType}
]

{ #category : #shadow }
TypShaPhaMetaLink >> mSelector: aLookup [
	<typShaMethod: 'selector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Symbol typAsType}
]
