Class {
	#name : #TypInfManifest,
	#superclass : #PackageManifest,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfManifest class >> invalidate [
	TypInfIndex invalidate.
	TypInfNodeStack resetSoleInstance
]
