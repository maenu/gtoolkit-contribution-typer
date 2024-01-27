Class {
	#name : #TypDynManifest,
	#superclass : #PackageManifest,
	#traits : 'TypTManifest',
	#classTraits : 'TypTManifest classTrait',
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynManifest class >> shortName [
	^ 'dynamic'
]
