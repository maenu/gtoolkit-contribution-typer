Class {
	#name : #TypShaGtGtMethodCoderAddOns,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAddOns class >> shadowedClass [
	^ GtMethodCoderAddOns class
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mAddMainActionIconAction: aLookup [
	<typShaMethod: 'addMainAction:icon:action:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{Symbol typAsType.
			Form typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)}
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mAddShortcut: aLookup [
	<typShaMethod: 'addShortcut:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {BlShortcut typAsType}
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mAddStyler: aLookup [
	<typShaMethod: 'addStyler:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {GtCoderBodyStyler typAsType}
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mStylers: aLookup [
	<typShaMethod: 'stylers'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {GtCoderBodyStyler typAsType})
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAddOns >> vModified: aLookup [
	<typShaForVariable: #modified>
	^ Set typAsType copyWithParameters: {Symbol typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAddOns >> vStylers: aLookup [
	<typShaForVariable: #stylers>
	^ SequenceableCollection typAsType
		copyWithParameters: {GtASTStyler typAsType}
]
