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
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{(SequenceableCollection typAsType
				copyWithParameters: {Symbol typAsType})}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaMetaLink >> mControl: aLookup [
	<typShaMethod: 'control:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Symbol typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaMetaLink >> mMetaObject: aLookup [
	<typShaMethod: 'metaObject:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{{Symbol typAsType.
			Object typAsType} typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaMetaLink >> mSelector: aLookup [
	<typShaMethod: 'selector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Symbol typAsType}
		argumentsOptional: false
		signalsAlways: false
]
