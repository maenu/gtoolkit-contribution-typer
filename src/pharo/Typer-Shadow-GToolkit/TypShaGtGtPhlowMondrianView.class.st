Class {
	#name : #TypShaGtGtPhlowMondrianView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowMondrianView class >> shadowedClass [
	^ GtPhlowMondrianView class
]

{ #category : #shadow }
TypShaGtGtPhlowMondrianView >> mPainting: aLookup [
	<typShaMethod: 'painting:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {GtMondrian typAsType}
				argumentsOptional: false
				signalsAlways: false)}
]
