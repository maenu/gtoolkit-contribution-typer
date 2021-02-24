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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {GtMondrian typAsType})}
]
