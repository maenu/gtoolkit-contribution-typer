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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{(SequenceableCollection typAsType
				copyWithParameters: {Symbol typAsType})}
]

{ #category : #shadow }
TypShaPhaMetaLink >> mControl: aLookup [
	<typShaMethod: 'control:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaMetaLink >> mMetaObject: aLookup [
	<typShaMethod: 'metaObject:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Symbol typAsType.
			Object typAsType} typAsType}
]

{ #category : #shadow }
TypShaPhaMetaLink >> mSelector: aLookup [
	<typShaMethod: 'selector:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Symbol typAsType}
]
